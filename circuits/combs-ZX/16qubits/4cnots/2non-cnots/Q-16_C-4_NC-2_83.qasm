OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[10], q[7];
x q[7];
cx q[14], q[7];
cx q[11], q[0];
z q[1];
cx q[5], q[0];
