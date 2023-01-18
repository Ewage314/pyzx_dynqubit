OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
x q[6];
cx q[6], q[7];
cx q[5], q[6];
x q[3];
cx q[7], q[3];
cx q[1], q[0];
