OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[0], q[15];
z q[18];
cx q[1], q[15];
cx q[18], q[1];
cx q[15], q[11];
