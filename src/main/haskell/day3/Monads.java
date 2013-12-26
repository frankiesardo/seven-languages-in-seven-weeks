import java.util.Arrays;
import java.util.LinkedList;
import java.util.List;

public class Monads {
    public interface Function<T, R> {
        public R call(T value);
    }

    public static class IdentityMonad<T> {
        public static final Function<Integer, IdentityMonad<Integer>> MULTIPLY_BY_SEVEN = new Function<Integer, IdentityMonad<Integer>>() {
            @Override
            public IdentityMonad<Integer> call(Integer value) {
                return IdentityMonad.wrap(value * 7);
            }
        };
        public static final Function<Integer, IdentityMonad<String>> REPEAT_X = new Function<Integer, IdentityMonad<String>>() {
            @Override
            public IdentityMonad<String> call(Integer value) {
                StringBuilder stringBuilder = new StringBuilder();
                for (int i = 0; i < value; i++) {
                    stringBuilder.append("x");
                }
                return IdentityMonad.wrap(stringBuilder.toString());
            }
        };

        private final T value;

        private IdentityMonad(T value) {
            this.value = value;
        }

        public static <T> IdentityMonad<T> wrap(T value) {
            return new IdentityMonad<T>(value);
        }

        public <R> IdentityMonad<R> pass(Function<T, IdentityMonad<R>> f) {
            return f.call(value);
        }

        private T read() {
            return value;
        }
    }

    public static class ListMonad<T> {
        public static final Function<Integer, ListMonad<Integer>> MULTIPLY_BY_SEVEN = new Function<Integer, ListMonad<Integer>>() {
            @Override
            public ListMonad<Integer> call(Integer value) {
                return ListMonad.wrap(value * 7);
            }
        };
        public static final Function<Integer, ListMonad<String>> REPEAT_X = new Function<Integer, ListMonad<String>>() {
            @Override
            public ListMonad<String> call(Integer value) {
                StringBuilder stringBuilder = new StringBuilder();
                for (int i = 0; i < value; i++) {
                    stringBuilder.append("x");
                }
                return ListMonad.wrap(stringBuilder.toString());
            }
        };

        private final List<T> values;

        private ListMonad(List<T> values) {
            this.values = values;
        }

        public static <T> ListMonad<T> wrap(T value) {
            List<T> list = new LinkedList<T>();
            list.add(value);
            return new ListMonad<T>(list);
        }

        private static <T> ListMonad<T> wrap(T... values) {
            return new ListMonad<T>(Arrays.asList(values));
        }

        public static <V> ListMonad<V> empty() {
            return new ListMonad<V>(new LinkedList<V>());
        }

        private ListMonad<T> plus(ListMonad<T> other) {
            List<T> combined = new LinkedList<T>(values);
            combined.addAll(other.read());
            return new ListMonad<T>(combined);
        }

        private List<T> read() {
            return values;
        }

        public <R> ListMonad<R> pass(Function<T, ListMonad<R>> f) {
            ListMonad<R> result = ListMonad.empty();
            for (T value : values) {
                result = result.plus(f.call(value));
            }
            return result;
        }
    }

    public static void main(String... args) {
        System.out.println(IdentityMonad.wrap(3).pass(IdentityMonad.MULTIPLY_BY_SEVEN).pass(IdentityMonad.REPEAT_X).read());
        System.out.println(ListMonad.wrap(1, 2, 3).pass(ListMonad.MULTIPLY_BY_SEVEN).pass(ListMonad.REPEAT_X).read());
    }
}
